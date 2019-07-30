#Image to text program using google cloud vision api

import pytesseract
import cv2
import numpy
import PIL

import re

pytesseract.pytesseract.tesseract_cmd = 'C:\\Program Files (x86)\\Tesseract-OCR\\tesseract.exe'

def read_image(image):
    image = cv2.resize(image, (0,0), fx = 3, fy = 3)
    ret,image = cv2.threshold(image, 127, 255, cv2.THRESH_BINARY)

    image = PIL.Image.fromarray(image, 'RGB')
    txt = pytesseract.image_to_string(image)

    return(txt)

def image_to_array(image_file):
    im = numpy.array(PIL.Image.open(image_file))
    im = cv2.cvtColor(im, cv2.COLOR_BGR2RGB)

    return(im)

def search_for_rxnum(text):
    pill_id = ''

    i = 0
    for current_letter in range(len(text)):
        if text[current_letter].lower() == 'r' or text[current_letter].lower() == 'n':
            if text[current_letter + 1].lower() == 'x' or text[current_letter + 1].lower() == 'o':
                #print('Found "Rx/No"')
                while text[current_letter + 2] == '.' or text[current_letter + 2] == ' ': #or text[current_letter + 2] == '#' or text[current_letter + 2] == ':':
                    i += 1
                    if is_number(text[current_letter + 2 + i]):
                        break
                while is_number(text[current_letter + 2 + i]) or text[current_letter + 2 + i] == '-':
                    pill_id += text[current_letter + 2 + i]
                    i += 1
    if pill_id == '':
        search_list = re.findall('[0-9]|\s{5}', text)
        for i in search_list:
            if len(pill_id) < 13:
                pill_id += i
        
    return(str(pill_id))

def is_number(s):
    try:
        float(s)
        return True
    except ValueError:
        return False

def image_to_pill_id(image_path):
    text = read_image(image_to_array(image_path))
    search_text = search_for_rxnum(text)
    print(text)
    return search_text


test = image_to_pill_id('test_image4.jpg')
print(test)