import pylab as pl

def main():
    f = open('signal.txt','r')
    d = pl.genfromtxt(f)
    pl.pcolor(d)
    pl.show()
if __name__ == "__main__":
    main()
