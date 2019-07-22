(
  (clear)
 
  (defn point (x y color) (fill (circle x y 0.1) color))

  (defn plot (p offset scale) (add offset (mul scale p)))

  (defn clifford (m n p q)
    (add (sin (mul p n)) (mul q (cos (mul p m))))
  )

  (defn _attractor (x y a b c d)
    (rest (
      (point
        (plot x 500 150)
        (plot y 400 150)
        "rgba(30,144,255,0.5)"
      )
      (clifford x y a c)
      (clifford y x b d)
    ))
  )

  (defn attractor (r a b c d)
    (reduce  
      (lambda (acc val)
        (first (
          (_attractor (first acc) (last acc) a b c d)
        )))
      (range 0 r)
      (2 1)
    )
  )

  (attractor 172000 -1.1 -1.0 -1.4 -1.6)
)