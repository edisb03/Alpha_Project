# import os
# import json

# class testdata_handling:
#     def __init__(self):
#         self.collection = {}
#         self.keypairs = {}      # Stores Path <--> filename pairs

#     def load_json_files(self, *args) -> dict:
#         """Reads JSON files, converts them into a dictionary. File name without extension will be used as primary key.

#         Returns:
#             dict: Content of the JSON files as dictionary
#         """        
#         for key in args:
#             self.keypairs[os.path.splitext(os.path.basename(key))[0]] = key
#             datei = open(key, encoding='utf-8')
#             self.collection[key] = json.load(datei)
#             datei.close()
#         return self.collection

#     def get_json_dictionary(self, *arg) -> dict:
#         """Returns a sub-dictionary from a JSON file. Accepts any number of arguments, starting with the file name (without extension), followed by all keys required from within the file

#         Raises:
#             KeyError: The key can't be found

#         Returns:
#             dict: a dictionary
#         """        
#         value = self.collection
#         for key in arg:
#             if(key not in value):
#                 if(key in self.keypairs):
#                     key = self.keypairs[key]
#             # print ('--> ' + key)
#             if(isinstance(value, dict)):
#                 value = value[key]
#             else:
#                 raise KeyError("Can't access key " + str(key) + " in get_json_dictionary()")
#         return value

#     def get_json_value(self, *arg) -> str:
#         """Returns a single value from a JSON file. Accepts any number of arguments, starting with the file name (without extension), followed by all keys required from within the file

#         Raises:
#             KeyError: The key can't be found

#         Returns:
#             str: a value
#         """        
#         value = self.collection
#         for key in arg:
#             if(key not in value):
#                 if(key in self.keypairs):
#                     key = self.keypairs[key]
#             if(isinstance(value, list)):
#                 value = value[key]
#             else:
#                 value = value.get(key)
#         if (isinstance(value, str) or isinstance(value, int) or isinstance(value, float)):
#             return value
#         raise KeyError("Can't access key " + str(key) + " in get_json_value()")

#     def string_contains(self, masterstr:str, searchstr:str) -> bool:
#         """Checks if a string contains a given substring

#         Args:
#             masterstr (str): Search IN this string 
#             searchstr (str): Search FOR this string

#         Returns:
#             bool: True if substring is found, else False
#         """        
#         return(searchstr.lower() in masterstr.lower())