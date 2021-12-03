from fpdf import FPDF
from pywebio.input import textarea, input
from pywebio import start_server
from pywebio.output import put_text

def app():
    text = textarea("Please insert the text for your PDF file", 
                    placeholder="Type anything you like", 
                    required=True)
                    
    save_location = input("What is the name of your PDF file?", required=True)
    create_pdf(text, save_location)
    put_text("Congratulations! A PDF file is generated for you.")
    
def create_pdf(text: str, save_location: str="output.pdf"):
    pdf = FPDF()
    pdf.add_page()
    pdf.set_font('Arial', '', 16)

    lines = text.split('\n')
    for i, sent in enumerate(lines):
        pdf.cell(40, 10, sent, 0, i+1)
        
    pdf.output(save_location, 'F')

import nest_asyncio
nest_asyncio.apply()
__import__('IPython').embed()

if __name__ == '__main__':
    start_server(app, port=37532, debug=True)
