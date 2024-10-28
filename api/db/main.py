import sqlalchemy as db 
from datetime import datetime
from fastapi import HTTPException
from dotenv import load_dotenv
import os

# load environment variables
load_dotenv()
user_name = os.getenv('user_name')
password = os.getenv('password')
hostname = os.getenv('host')
port = os.getenv('port')
db_name = os.getenv('db_name')

class BiblioSphereDB:
    def __init__(self):
        try:
            self.engine = db.create_engine(f'mysql+mysqlconnector://{user_name}:{password}@{hostname}:{port}/{db_name}')
            self.connection = self.engine.connect()
            self.metadata = db.MetaData()
            print("Database Connection Established Successfully")

        except Exception as e:
            raise HTTPException(status_code=500, detail=f"Internal Server Error: {str(e)}")
        
    
    def listOfBiblio(self):
        try:
            ResultSet = []
            biblio = self.getBiblio()
            authors = self.getAuthors()
            item_types = self.getItemTypes()
            genre = self.getGenre()
            publisher = self.getPublisher()
            rating = self.getRatings()
            biblio_items = self.getBiblioItems()

            query = db.Select(
                biblio.c.biblio_name,
                biblio.c.biblio_desc,
                authors.c.author_name,
                genre.c.genre_name,
                publisher.c.publisher_name,
                rating.c.rating,
                biblio_items.c.published_date,
                item_types.c.itemtype_name

            ).join(authors).join(item_types).join(genre).join(publisher).join(biblio_items).join(rating
            ).filter(biblio.c.author_id == authors.c.author_id).filter(biblio.c.itemtype_id == item_types.c.itemtype_id
            ).filter(biblio.c.genre_id == genre.c.genre_id).filter(publisher.c.publisher_id == biblio.c.publisher_id
            ).filter(biblio_items.c.biblio_id == biblio_items.c.biblio_id).filter(biblio.c.biblio_id == rating.c.biblio_id)

            result = self.connection.execute(query)
            print(str(query))
            for i in result:
                ResultSet.append(i._asdict())
            return ResultSet 
        except Exception as e:
            raise HTTPException(status_code=500, detail=f"Internal Server Error: {str(e)}")
        
        
    def listBiblioByAuthor(self, author_id):
        try:
            ResultSet = []
            biblio = self.getBiblio()
            authors = self.getAuthors()
            item_types = self.getItemTypes()
            genre = self.getGenre()
            publisher = self.getPublisher()
            rating = self.getRatings()
            biblio_items = self.getBiblioItems()

            query = db.Select(
                biblio.c.biblio_name,
                biblio.c.biblio_desc,
                authors.c.author_name,
                genre.c.genre_name,
                publisher.c.publisher_name,
                rating.c.rating,
                biblio_items.c.published_date,
                item_types.c.itemtype_name
            ).join(authors).join(item_types).join(genre).join(publisher).join(biblio_items).join(rating
            ).filter(biblio.c.author_id == authors.c.author_id).filter(biblio.c.itemtype_id == item_types.c.itemtype_id
            ).filter(biblio.c.genre_id == genre.c.genre_id).filter(publisher.c.publisher_id == biblio.c.publisher_id
            ).filter(biblio_items.c.biblio_id == biblio_items.c.biblio_id).filter(biblio.c.biblio_id == rating.c.biblio_id).where(authors.c.author_id == author_id)
            result = self.connection.execute(query)
            print(query)
            for i in result:
                ResultSet.append(i._asdict())
            return ResultSet 
        
        except Exception as e:
            raise HTTPException(status_code=500, detail=f"Internal Server Error: {str(e)}")
        
    def listAvailableBiblio(self):
        pass

    def listAuthors(self):
        try:
            ResultSet = []
            authors = self.getAuthors()
            query = db.Select(authors)
            result = self.connection.execute(query)
            print(query)
            for i in result:
                ResultSet.append(i._asdict())
            return ResultSet 
        
        except Exception as e:
            raise HTTPException(status_code=500, detail=f"Internal Server Error: {str(e)}")
         
    def listBorrowerWithBiblioItems(self,borrower_id):
        try:
            ResultSet = []
            borrowers = self.getBorrowers()
            loans = self.getLoans()
            biblio = self.getBiblio()
            authors = self.getAuthors()
            item_types = self.getItemTypes()
            genre = self.getGenre()
            publisher = self.getPublisher()
            rating = self.getRatings()
            biblio_items = self.getBiblioItems()
            items = self.getItems()

            query = db.Select(
                borrowers.c.name,
                borrowers.c.phone,
                loans.c.loaned_on,
                loans.c.returned_on,
                loans.c.status,
                biblio.c.biblio_name,
                biblio.c.biblio_desc,
                authors.c.author_name,
                biblio_items.c.isbn,
                publisher.c.publisher_name,
                rating.c.rating

            ).join(loans).filter(loans.c.item_id == items.c.item_id
            ).filter(items.c.biblioitems_id == biblio_items.c.biblioitems_id
            ).filter(biblio.c.biblio_id == biblio_items.c.biblio_id
            ).filter(authors.c.author_id == biblio.c.author_id
            ).filter(genre.c.genre_id == biblio.c.genre_id
            ).filter(item_types.c.itemtype_id == biblio_items.c.itemtype_id 
            ).filter(biblio.c.publisher_id == publisher.c.publisher_id
            ).filter(rating.c.biblio_id == biblio.c.biblio_id
            ).where((loans.c.borrower_id == borrower_id) & (loans.c.status == 1)).select_from(borrowers)
            
            result = self.connection.execute(query)

            print(query)

            for i in result:
                ResultSet.append(i._asdict())
            return ResultSet 
        
        except Exception as e:
            raise HTTPException(status_code=500, detail=f"Internal Server Error: {str(e)}")

    def listBorrowersReserved(self,borrower_id):
        try:
            ResultSet = []
            borrowers = self.getBorrowers()
            reserves = self.getReserves()
            biblio = self.getBiblio()
            authors = self.getAuthors()
            item_types = self.getItemTypes()
            genre = self.getGenre()
            publisher = self.getPublisher()
            rating = self.getRatings()
            biblio_items = self.getBiblioItems()
            items = self.getItems()

            query = db.Select(
                borrowers.c.name,
                borrowers.c.phone,
                reserves.c.date_reserved,
                reserves.c.status,
                reserves.c.expiration_date,
                biblio.c.biblio_name,
                biblio.c.biblio_desc,
                authors.c.author_name,
                biblio_items.c.isbn,
                publisher.c.publisher_name,
                rating.c.rating

            ).join(reserves).filter(reserves.c.item_id == items.c.item_id
            ).filter(items.c.biblioitems_id == biblio_items.c.biblioitems_id
            ).filter(biblio.c.biblio_id == biblio_items.c.biblio_id
            ).filter(authors.c.author_id == biblio.c.author_id
            ).filter(genre.c.genre_id == biblio.c.genre_id
            ).filter(item_types.c.itemtype_id == biblio_items.c.itemtype_id 
            ).filter(biblio.c.publisher_id == publisher.c.publisher_id
            ).filter(rating.c.biblio_id == biblio.c.biblio_id
            ).where(reserves.c.borrower_id == borrower_id).select_from(borrowers)
            
            result = self.connection.execute(query)

            print(query)

            for i in result:
                ResultSet.append(i._asdict())
            return ResultSet 
        
        except Exception as e:
            raise HTTPException(status_code=500, detail=f"Internal Server Error: {str(e)}")
        
    def getBorrowersHistory(self, borrower_id):
        try:
            ResultSet = []
            borrowers = self.getBorrowers()
            loans = self.getLoans()
            biblio = self.getBiblio()
            authors = self.getAuthors()
            item_types = self.getItemTypes()
            genre = self.getGenre()
            publisher = self.getPublisher()
            rating = self.getRatings()
            biblio_items = self.getBiblioItems()
            items = self.getItems()

            query = db.Select(
                borrowers.c.name,
                borrowers.c.phone,
                loans.c.loaned_on,
                loans.c.returned_on,
                loans.c.status,
                biblio.c.biblio_name,
                biblio.c.biblio_desc,
                authors.c.author_name,
                biblio_items.c.isbn,
                publisher.c.publisher_name,
                rating.c.rating

            ).join(loans).filter(loans.c.item_id == items.c.item_id
            ).filter(items.c.biblioitems_id == biblio_items.c.biblioitems_id
            ).filter(biblio.c.biblio_id == biblio_items.c.biblio_id
            ).filter(authors.c.author_id == biblio.c.author_id
            ).filter(genre.c.genre_id == biblio.c.genre_id
            ).filter(item_types.c.itemtype_id == biblio_items.c.itemtype_id 
            ).filter(biblio.c.publisher_id == publisher.c.publisher_id
            ).filter(rating.c.biblio_id == biblio.c.biblio_id
            ).where(loans.c.borrower_id == borrower_id).select_from(borrowers)
            
            result = self.connection.execute(query)

            print(query)

            for i in result:
                ResultSet.append(i._asdict())
            return ResultSet 
        
        except Exception as e:
            raise HTTPException(status_code=500, detail=f"Internal Server Error: {str(e)}")
        
    # load tables
    def getBiblio(self):
        biblio = db.Table('biblio',self.metadata,autoload_with=self.engine)
        return biblio 
    
    def getAuthors(self):
        authors = db.Table('author',self.metadata,autoload_with=self.engine)
        return authors
    
    def getItemTypes(self):
        item_types = db.Table('ItemType',self.metadata,autoload_with=self.engine)
        return item_types 
    
    def getGenre(self):
        genre = db.Table('ItemGenre',self.metadata,autoload_with=self.engine)
        return genre

    def getPublisher(self):
        publisher = db.Table('PublisherDetails',self.metadata,autoload_with=self.engine)
        return publisher
    
    def getRatings(self):
        ratings = db.Table('Ratings',self.metadata,autoload_with=self.engine)
        return ratings 
    
    def getBiblioItems(self):
        biblio_items = db.Table('BiblioItems',self.metadata,autoload_with=self.engine)
        return biblio_items

    def getBorrowers(self):
        borrowers = db.Table('Borrowers',self.metadata,autoload_with=self.engine)
        return borrowers 
    
    def getLoans(self):
        loans = db.Table('Loan',self.metadata,autoload_with=self.engine)
        return loans
    
    def getItems(self):
        items = db.Table('Items',self.metadata,autoload_with=self.engine)
        return items
    
    def getReserves(self):
        reserves = db.Table('Reserves',self.metadata,autoload_with=self.engine)
        return reserves


