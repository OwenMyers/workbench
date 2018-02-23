
import unittest
import sys
sys.path.append("../")
import simple_classes

class TestSimpleObj(unittest.TestCase):

    def test_add_atribs(self):
        new_simp_obj = simple_classes.SimpleObj()
        added = new_simp_obj.add_atribs()
        self.assertEqual(added,3)

if __name__ == "__main__":
    unittest.main()