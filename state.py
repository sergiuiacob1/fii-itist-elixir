import threading
class Wallet:
    def __init__(self, amount):
        self.amount = amount
    def deposit(self, value):
        self.amount += value
    def get(self, value):
        to_return = min(value, self.amount)
        self.amount -= to_return
        return to_return

wallet = Wallet(100)
