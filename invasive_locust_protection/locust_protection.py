import numpy as np
import sounddevice as sd

# Set the frequency and duration of the sound
frequency = 20000  # 20 kHz, you can adjust the frequency higher if needed
duration = 5  # Duration in seconds

# Create the sound signal (sine wave)
sample_rate = 44100  # Sample rate, commonly used
t = np.linspace(0, duration, int(sample_rate * duration), endpoint=False)
sound_wave = 0.5 * np.sin(2 * np.pi * frequency * t)

# Start playing the sound
sd.play(sound_wave, sample_rate)

# Wait for the sound to finish
sd.wait()
