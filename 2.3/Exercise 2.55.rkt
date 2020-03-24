#lang sicp

; Exercise 2.55 - (car ''abracadabra) yields quote; explain

; (car ''abracadabra) -> (car (quote (quote abracadabra))
; because of the first quote the second object is interpreted as a list of two strings "quote" and "abracadabra"
; car-ing that list yields "quote"