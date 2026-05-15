import unittest

from hello_world import app


class TestViews(unittest.TestCase):

    def test_index_json(self):
        tester = app.test_client(self)
        rv = tester.get('/?output=json')
        self.assertEqual(b'{ "imie":"Wiktor", "msg":"Hello World!"}', rv.data)