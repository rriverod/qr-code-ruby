# Write your solution here!
require "rqrcode"

puts "What kind of QR code would you like to generate?\n\n1. Open a URL\n2. Join a wifi network\n3. Send a text message\n\n Press 4 to exit"
qr_type=gets.chomp

  if qr_type=="1"
    puts "What is the URL you would like to encode?\n"
    url=gets.chomp
    puts "\nWhat would you like to call the PNG?\n"
    name=gets.chomp
    qrcode = RQRCode::QRCode.new("#{url}")
    png = qrcode.as_png({ :size => 500 })
    IO.binwrite("#{name}.png", png.to_s)

  elsif qr_type=="2"
    puts "\nWhat is the name of the wifi network?\n"
    wifi=gets.chomp
    puts "\nWhat is the password\n"
    password=gets.chomp
    puts "\nWhat would you like to call the PNG?\n"
    name=gets.chomp
    qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:#{wifi};P:#{password};;")
    png = qrcode.as_png({ :size => 500 })
    IO.binwrite("#{name}.png", png.to_s)

  elsif qr_type=="3"
    puts "\nWhat is the phone number you want the code to send a text message to?\n"
    number=gets.chomp
    puts "\nWhat do you want to populate the message with?\n"
    message=gets.chomp
    puts "\nWhat would you like to call the PNG?\n"
    name=gets.chomp
    qrcode = RQRCode::QRCode.new("SMSTO:#{number}:#{message}")
    png = qrcode.as_png({ :size => 500 })
    IO.binwrite("#{name}.png", png.to_s)

  elsif qr_type=="4"
    puts "\nGoodbye!\n"
    exit

  else
    puts "\nDidn't recognize that selection. Please try again.\n"
    exit

  end
