;; Costume Registration Contract
;; Records details of valuable performance attire

(define-data-var last-costume-id uint u0)

(define-map costumes
  { costume-id: uint }
  {
    name: (string-ascii 100),
    description: (string-ascii 500),
    creation-date: uint,
    designer: (string-ascii 100),
    materials: (string-ascii 200),
    size: (string-ascii 20),
    owner: principal
  }
)

(define-public (register-costume
    (name (string-ascii 100))
    (description (string-ascii 500))
    (designer (string-ascii 100))
    (materials (string-ascii 200))
    (size (string-ascii 20))
  )
  (let
    (
      (costume-id (+ (var-get last-costume-id) u1))
    )
    (var-set last-costume-id costume-id)
    (map-set costumes
      { costume-id: costume-id }
      {
        name: name,
        description: description,
        creation-date: block-height,
        designer: designer,
        materials: materials,
        size: size,
        owner: tx-sender
      }
    )
    (ok costume-id)
  )
)

(define-read-only (get-costume (costume-id uint))
  (map-get? costumes { costume-id: costume-id })
)

(define-public (transfer-costume (costume-id uint) (new-owner principal))
  (let
    (
      (costume (unwrap! (get-costume costume-id) (err u1)))
    )
    (asserts! (is-eq tx-sender (get owner costume)) (err u2))
    (map-set costumes
      { costume-id: costume-id }
      (merge costume { owner: new-owner })
    )
    (ok true)
  )
)
