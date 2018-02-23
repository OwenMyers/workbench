# Just trying to implement what was done in
# https://pymotw.com/2/xml/etree/ElementTree/create.html

import xml.etree.ElementTree as ET
from xml.dom import minidom
import time
from java.io import ByteArrayOutputStream
from java.io import DataOutputStream
import base64


def clean_up_output(elem):
    """Return an XML string for the Element with proper indents and returns. """

    rough_string = ET.tostring(elem, 'utf-8')
    reparsed = minidom.parseString(rough_string)
    # return reparsed.toprettyxml(indent="")
    return reparsed.toxml()


def playWithByteStream():
    baos = ByteArrayOutputStream()
    ds = DataOutputStream(baos)
    ds.write(1)
    ds.flush()
    ds.write(2)
    ds.flush()

    print baos.toByteArray()

    print "type(baos.toByteArray()): " + str(type(baos.toByteArray()))

    print "base 64 encoded: "
    print base64.b64encode(baos.toByteArray())


def getProperBase64EncodingOfIntArr(cur_scan_arr):
    baos = ByteArrayOutputStream()
    ds = DataOutputStream(baos)
    for i in cur_scan_arr:
        ds.writeInt(i)
        ds.flush()

    return base64.b64encode(baos.toByteArray())


def getProperBase64EncodingOfFloatArr(cur_scan_arr):
    baos = ByteArrayOutputStream()
    ds = DataOutputStream(baos)
    for i in cur_scan_arr:
        ds.writeFloat(i)
        ds.flush()

    return base64.b64encode(baos.toByteArray())


def main():
    file_name = 'centroided_DC_010814_StandardsMixTest1_34StandardMix_01.mzXML.CDF'
    number_of_peaks = 1;
    method_name = 'Peak Detection: ADAP 3D profile'
    # This is in the structure:
    # parameter1: value1, parameter2: value2: ...
    method_parameters = 'param1: 0.0'

    top = ET.Element('peaklist')

    file_name_elem = ET.SubElement(top, 'pl_name')
    file_name_elem.text = file_name + ': Peaks detected'
    time_created_elem = ET.SubElement(top, 'created')
    time_created_elem.text = time.strftime("%d/%m/%Y") + ' ' + time.strftime("%H:%M:%S")
    number_of_peaks_elem = ET.SubElement(top, 'quantity')
    number_of_peaks_elem.text = str(number_of_peaks)

    applied_method_elem = ET.SubElement(top, 'applied_method')
    method_name_elem = ET.SubElement(applied_method_elem, 'method_name')
    method_name_elem.text = method_name
    method_parameters_elem = ET.SubElement(applied_method_elem, 'method_parameters')
    method_parameters_elem.text = method_parameters

    raw_file_elem = ET.SubElement(top, 'raw_file')
    raw_file_elem.text = file_name

    #######################################################################
    # begin rows -> this will need to be in a loop when you actualy use it
    #######################################################################
    cur_id_num = 1
    cur_peak_mz = 140.95191955566406
    cur_peak_rt = 1263.4
    cur_peak_height = 2.2376146E7
    cur_peak_area = 1.2332098322653784E8
    cur_peak_status = "DETECTED"
    cur_peak_charge = 0

    # This is for the best scan element which looks like it is just the scan number of the highest
    # intensity in the peak.
    cur_best_scan = 1427
    # This will not be necesary for now -> should be -1 if no meaning
    cur_fragment_scan = -1
    # I don't know what this is. look into it. Might just be random label
    cur_quantity = 4

    cur_scan_arr = [22, 23, 24, 25]
    cur_mz_arr = [140.95191955566406, 140.95191955566406, 140.95191955566406, 140.95191955566406]
    cur_height_arr = [1E6, 1E6, 1E6, 1E6]
    for i in range(cur_quantity):
        cur_scan_arr64 = getProperBase64EncodingOfIntArr(cur_scan_arr)
        cur_mz_arr64 = getProperBase64EncodingOfFloatArr(cur_mz_arr)
        cur_height_arr64 = getProperBase64EncodingOfFloatArr(cur_height_arr)

    # Figure out correct format for these
    cur_scan_id = cur_scan_arr64
    cur_mz = cur_mz_arr64
    cur_height = cur_height_arr64

    row_elem = ET.SubElement(top, 'row', {'id': str(cur_id_num)})
    peak_elem = ET.SubElement(row_elem, 'peak', {
        'column_id': file_name,
        'mz': str(cur_peak_mz),
        'rt': str(cur_peak_rt),
        'height': str(cur_peak_height),
        'area': str(cur_peak_area),
        'status': cur_peak_status,
        'charge': str(cur_peak_charge)
    })

    best_scan_elem = ET.SubElement(peak_elem, 'best_scan')
    best_scan_elem.text = str(cur_best_scan)
    fragment_scan_elem = ET.SubElement(peak_elem, 'fragment_scan')
    fragment_scan_elem.text = str(cur_fragment_scan)

    mz_peaks_elem = ET.SubElement(peak_elem, 'mzpeaks', {'quantity': str(cur_quantity)})
    scan_id_elem = ET.SubElement(mz_peaks_elem, 'scan_id')
    scan_id_elem.text = str(cur_scan_id)
    mz_elem = ET.SubElement(mz_peaks_elem, 'mz')
    mz_elem.text = cur_mz
    height_elem = ET.SubElement(mz_peaks_elem, 'height')
    height_elem.text = cur_height

    # f = open('test_out.xml','w')
    # rough_string = ET.tostring(top , 'utf-8')
    # f.write(rough_string)
    # f.close()

    f = open('test_out.xml', 'w')
    f.write(clean_up_output(top))
    f.close()


if __name__ == '__main__':
    main()
