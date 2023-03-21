def detonation_in(seconds_left)
    puts("detonation in... #{seconds_left} seconds.")
  end
  
  timer = 10
  
  while (timer > 0)
    detonation_in(timer)
    timer -= 1
  end
