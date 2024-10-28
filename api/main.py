from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from datetime import datetime 
from db.main import BiblioSphereDB

origins = [
    "http://localhost:3000",
    "*"
]

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

db = BiblioSphereDB()

class Authors(BaseModel):
    author_id : int 
    author_name : str 
    
@app.get('/')
def home():
    return {"BiblioSphere API v0.1"}

@app.get('/list/biblio')
def biblio():
    return db.listOfBiblio()

@app.get('/list/authors')
def authors():
    return db.listAuthors()

@app.get('/list/author/biblio/{author_id}')
def author_biblio(author_id):
    return db.listBiblioByAuthor(author_id)

@app.get('/list/biblio/borrowers/{borrower_id}')
def borrower_biblio(borrower_id):
    return db.listBorrowerWithBiblioItems(borrower_id)

@app.get('/list/biblio/borrowers/reserves/{borrower_id}')
def borrower_biblio(borrower_id):
    return db.listBorrowersReserved(borrower_id)

@app.get('/history/borrowers/{borrower_id}')
def borrower_history(borrower_id):
    return db.getBorrowersHistory(borrower_id)
