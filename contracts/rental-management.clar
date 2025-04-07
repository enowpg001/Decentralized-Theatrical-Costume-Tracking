;; Rental Management Contract
;; Handles borrowing between theater companies

(define-data-var last-rental-id uint u0)

(define-map rentals
  { rental-id: uint }
  {
    costume-id: uint,
    borrower: principal,
    lender: principal,
    start-date: uint,
    end-date: uint,
    rental-fee: uint,
    deposit: uint,
    status: (string-ascii 20), ;; "pending", "active", "returned", "cancelled"
    notes: (string-ascii 500)
  }
)

(define-public (create-rental
    (costume-id uint)
    (borrower principal)
    (start-date uint)
    (end-date uint)
    (rental-fee uint)
    (deposit uint)
    (notes (string-ascii 500))
  )
  (let
    (
      (rental-id (+ (var-get last-rental-id) u1))
    )
    (var-set last-rental-id rental-id)
    (map-set rentals
      { rental-id: rental-id }
      {
        costume-id: costume-id,
        borrower: borrower,
        lender: tx-sender,
        start-date: start-date,
        end-date: end-date,
        rental-fee: rental-fee,
        deposit: deposit,
        status: "pending",
        notes: notes
      }
    )
    (ok rental-id)
  )
)

(define-public (accept-rental (rental-id uint))
  (let
    (
      (rental (unwrap! (get-rental rental-id) (err u1)))
    )
    (asserts! (is-eq tx-sender (get borrower rental)) (err u2))
    (asserts! (is-eq (get status rental) "pending") (err u3))

    (map-set rentals
      { rental-id: rental-id }
      (merge rental { status: "active" })
    )
    (ok true)
  )
)

(define-public (return-costume (rental-id uint))
  (let
    (
      (rental (unwrap! (get-rental rental-id) (err u1)))
    )
    (asserts! (or (is-eq tx-sender (get borrower rental)) (is-eq tx-sender (get lender rental))) (err u2))
    (asserts! (is-eq (get status rental) "active") (err u3))

    (map-set rentals
      { rental-id: rental-id }
      (merge rental { status: "returned" })
    )
    (ok true)
  )
)

(define-read-only (get-rental (rental-id uint))
  (map-get? rentals { rental-id: rental-id })
)
