from fastapi import FastAPI
#from db.db import PriceWatchDB
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

# db = PriceWatchDB()
db = BiblioSphereDB()
# class Bearings(BaseModel):
#     size: str
#     vendor_name: str
#     rate: float 
#     bill_rate: float 

# class GetBearings(BaseModel):
#     size: str
#     vendor_id: int

class Authors(BaseModel):
    author_id : int 
    author_name : str 
    
@app.get('/')
def home():
    return {"BiblioSphere API v0.1"}

@app.get('/list/biblio')
def biblio():
    return db.listOfBiblio()

@app.get('/list/author/biblio/{author_id}')
def author_biblio(author_id):
    return db.listBooksByAuthor(author_id)

@app.get('/list/biblio/borrowers/{borrower_id}')
def borrower_biblio(borrower_id):
    return db.listBorrowerWithBiblioItems(borrower_id)


@app.get('/list/biblio/borrowers/reserves/{borrower_id}')
def borrower_biblio(borrower_id):
    return db.listBorrowersReserved(borrower_id)
