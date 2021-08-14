import telegram

from telegram import Update, ForceReply
from telegram.ext import Updater, CommandHandler, MessageHandler, Filters, CallbackContext
from dotenv import dotenv_values

from Db import db

config = dotenv_values()
bot = telegram.Bot(config["telegram_bot_token"])

# bot functions that are not commands
def announceOnStock(items, chats):    
    for item in items:
        """"print("----individual item----")
        print(item)"""
        for chat in chats:
            """print("----individual chat----")
            print(chat)"""
            prettyItemString = f'Now on stock!!! 🤯\n\n{item["Model"]} at {item["Link"]}\n\nGo for it!!!🏃‍♂️'
            bot.send_message(text=prettyItemString, chat_id=chat["Chat_id"])    
        db.setNotifiedItem(item)

# bot commands
def start_command(update: Update, context: CallbackContext) -> None:    
    user = update.effective_user
    """
    print("----the update---")
    print(update)
    print("----the chat type---")
    print(update.message.chat.type)        
    print("----the user---")    
    print(user)    
    """
    update.message.reply_markdown_v2(
        fr'Welcome {user.mention_markdown_v2()}\! here is the command list',        
    )

    commandList = """/start reboot the bot
    /enable enable "on stock" messages
    /disable disable "on stock" messages
    /status status of "on stock" messages
    /onstock list of all aviable gpu at this moment
    /donateinfo display all donation info"""
    
    update.message.reply_text(commandList)

    try:
        db.storeChat(update.message.chat.type, update.message.chat)    
    except:
        print("user already exists")

def enable_command(update: Update, context: CallbackContext):
    update.message.reply_text("this command is still under construction 🤓")


def disable_command(update: Update, context: CallbackContext):
    update.message.reply_text("this command is still under construction 🤓")


def status_command(update: Update, context: CallbackContext):
    update.message.reply_text("this command is still under construction 🤓")


def onStock_command(update: Update, context: CallbackContext):
    try:
        items = db.onStockNow()
        if items is not None:
            update.message.reply_text("On stock now!!! 🤯")
            for item in items:         
                prettyItemString = f'{item["Model"]} at {item["Link"]}'  
                update.message.reply_text(prettyItemString)
            update.message.reply_text(f'Found this bot useful? consider make some donation at /donateinfo')
        else:
            update.message.reply_text("Nothing on stock at this momment... 😪")
    except:
        print("error getting aviability")


def donateinfo_command(update: Update, context: CallbackContext):
    donateInfo = """You can make donations on BTC and DOGE to this wallet addresses: 👇
                BTC: someAddress
                DOGE: someAddress
                """
    update.message.reply_text(donateInfo)
    update.message.reply_text("this command is still under construction 🤓")


def botStart() -> None:    
    # Create the Updater and pass it your bot's token.
    updater = Updater(config["telegram_bot_token"])

    # Get the dispatcher to register handlers
    dispatcher = updater.dispatcher

    # on different commands - answer in Telegram
    dispatcher.add_handler(CommandHandler("start", start_command))
    dispatcher.add_handler(CommandHandler("enable", enable_command))
    dispatcher.add_handler(CommandHandler("disable", disable_command))
    dispatcher.add_handler(CommandHandler("status", status_command))
    dispatcher.add_handler(CommandHandler("onstock", onStock_command))
    dispatcher.add_handler(CommandHandler("donateinfo", donateinfo_command))

    # Start the Bot
    updater.start_polling()    
    updater.idle()