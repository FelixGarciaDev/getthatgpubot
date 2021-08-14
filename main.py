import logging
import threading
import time

from dotenv import dotenv_values

from Telegram import telegramBot 
from Db import db

# Enable logging
logging.basicConfig(
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s', level=logging.INFO
)

logger = logging.getLogger(__name__)

config = dotenv_values()

def loopDb():
    while True:
        time.sleep(1)
        items = db.onStockLive()
        # print("----items----")
        # print(items)
        if items is not None:
            chats = db.getActiveChats()
            # print("----chats----")        
            # print(items)
            if chats is not None:
                telegramBot.announceOnStock(items, chats)

def loopPrinting():
    while True:
        time.sleep(1)
        print("some print...")

def main():
    threading.Thread(target=loopDb).start()
    threading.Thread(target=telegramBot.botStart()).start()
    


if __name__ == '__main__':
    main()