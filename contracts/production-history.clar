;; Production History Contract
;; Documents use of costumes in specific performances

(define-data-var last-production-id uint u0)
(define-data-var last-usage-id uint u0)

(define-map productions
  { production-id: uint }
  {
    name: (string-ascii 100),
    venue: (string-ascii 100),
    start-date: uint,
    end-date: uint,
    director: (string-ascii 100),
    producer: principal
  }
)

(define-map costume-usage
  { usage-id: uint }
  {
    costume-id: uint,
    production-id: uint,
    character: (string-ascii 100),
    actor: (string-ascii 100),
    notes: (string-ascii 500)
  }
)

(define-public (register-production
    (name (string-ascii 100))
    (venue (string-ascii 100))
    (start-date uint)
    (end-date uint)
    (director (string-ascii 100))
  )
  (let
    (
      (production-id (+ (var-get last-production-id) u1))
    )
    (var-set last-production-id production-id)
    (map-set productions
      { production-id: production-id }
      {
        name: name,
        venue: venue,
        start-date: start-date,
        end-date: end-date,
        director: director,
        producer: tx-sender
      }
    )
    (ok production-id)
  )
)

(define-public (record-costume-usage
    (costume-id uint)
    (production-id uint)
    (character (string-ascii 100))
    (actor (string-ascii 100))
    (notes (string-ascii 500))
  )
  (let
    (
      (usage-id (+ (var-get last-usage-id) u1))
    )
    (var-set last-usage-id usage-id)
    (map-set costume-usage
      { usage-id: usage-id }
      {
        costume-id: costume-id,
        production-id: production-id,
        character: character,
        actor: actor,
        notes: notes
      }
    )
    (ok usage-id)
  )
)

(define-read-only (get-production (production-id uint))
  (map-get? productions { production-id: production-id })
)

(define-read-only (get-costume-usage (usage-id uint))
  (map-get? costume-usage { usage-id: usage-id })
)
