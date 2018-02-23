
def main():
    print "testing a better way for relative import paths"

    opd = peakdetector.PeakDetector()
#    print "__file__: " + __file__
#    print "path.dirname(path.dirname(path.abspath(__file__)))\n    " +path.dirname(path.dirname(path.abspath(__file__)))
#
#    sys.path.append(path.dirname(path.dirname(path.abspath(__file__))))
#    from peakdetectioncwt import peakdetector

if __name__ == "__main__":
    if __package__ is None:
        import sys
        from os import path
        sys.path.append(path.dirname(path.dirname(path.abspath(__file__))))
        from peakdetectioncwt import peakdetector
    else:
        from ..peakdetectioncwt import peakdetector
    main()
