;; title: Counter
;; version: 1.0.0
;; summary: A simple counter contract
;; description: This contract implements a simple counter that can be incremented and decremented.

;; traits
;;

;; token definitions
;;

;; constants
;;

;; data vars
;;

;; data maps
;;
(define-map Counters principal uint);; key is principal, value is counter/uint

;; public functions
;;
(define-public (count-up)
  (ok (map-set Counters tx-sender (+ (get-count tx-sender) u1)))
)

;; read only functions
;;
(define-read-only (get-count (who principal))
  (default-to u0 (map-get? Counters who))
)

;; private functions
;;

