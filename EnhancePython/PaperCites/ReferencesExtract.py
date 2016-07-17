#coding:utf-8
"""
extract the references from paper(pdf).
Ref:
PdfMiner:http://denis.papathanasiou.org/posts/2010.08.04.post.html
"""


_author_ = 'Liao Pan'

import os
import pdb

PDF_DIR = r"/home/reallocing/Git/MyCodeSpace/EnhancePython/PaperCites/A tutorial on machine learning in educational science.pdf"
PDF_DIR1 = r"/home/reallocing/Git/MyCodeSpace/EnhancePython/PaperCites/1602.07029v1.pdf"
PDF_DIR2 = r"/home/reallocing/Git/MyCodeSpace/EnhancePython/PaperCites/Fuzzy Student Model in InterMediActor Platform.pdf"

def parser_pdf(pdf_dir):
    """

    :param pdf_dir:
    :return: txt
    """"pdf2txt.py -o out.txt"
    #pdb.set_trace()
    pdfname = os.path.split(pdf_dir)[1].replace(" ","\ ")

    #pdfname = " A\ tutorial\ on\ machine\ learning\ in\ educational\ science.pdf"
    cmd = "pdf2txt.py -o out.txt"+" "+pdfname
    os.system(cmd)







def extract_reference_paper_from_txt():
    """

    :return: List [reference paper]
    """
    pass

print("hellpo")
parser_pdf(PDF_DIR2)
