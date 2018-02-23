import xml.etree.ElementTree as ET


def main():
    tree = ET.parse('test_peaks_from_mzmine.xml')

    root = tree.getroot()

    print "root.tag: " + str(root.tag)


if __name__ == '__main__':
    main()
