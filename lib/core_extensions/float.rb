class Float
  def round2
    round(2)
  end

  def round_up_to_nearest_5_cents
    ((to_f * (20.0)).ceil / (20.0))
  end
end
