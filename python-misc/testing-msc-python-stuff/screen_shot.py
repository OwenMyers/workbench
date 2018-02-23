import time
import os

def main():

    length_time = 10.0
    sleep_time = .5

    curent_time = 0.0
    count = 0
    while curent_time < length_time:

        os.system("screencapture ~/Desktop/ScreenShots/"+str(count)+"screenshot.jpg")

        count+= 1

        curent_time += sleep_time

        print("curent_time is: " +str(curent_time))

if __name__ == "__main__":
    main()
