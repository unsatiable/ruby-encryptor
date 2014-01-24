class Encryptor

  def cipher(rotation)
    characters = (" ".."z").to_a
    characters << "\n"
    rotated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotated_characters)]
   
  end

  def crack(string)
    cipher(1).count.times do |i|
      puts encrypt(string, i)
    end
    
  end

  def encrypt(string, rotation)
    letters = string.split("")
    encrypted_letters = letters.collect do |letter|
      encrypt_letter(letter, rotation)
    end

    encrypted_letters.join("")
  end

  def encrypt_file(filename, rotation)
    # Creat the file handle to 
    input = File.open(filename, "r")
    # Read the text of the input file
    text = input.read
    # Encrypt the text
    encrypted_text = encrypt(text,rotation)
    # Create a name for the output file
    new_name = filename + '.encrypted'
    # Create an output file handle
    new_name = File.open(new_name, "w")
    # Write out the text
    new_name.write(encrypted_text)
    # Close the file
    new_name.close
  end
    
  def encrypt_letter(letter, rotation)
    cipher_rotation = cipher(rotation)
    cipher_rotation[letter]
  end

  def decrypt_file(filename, rotation)
    # Creat the file handle to 
    input = File.open(filename, "r")
    # Read the text of the input file
    text = input.read
    # Encrypt the text
    encrypted_text = encrypt(text,rotation)
    # Create a name for the output file
    new_name = filename + '.decrypted' 
    # Create an output file handle
    new_name = File.open(new_name, "w")
    # Write out the text
    new_name.write(encrypted_text)
    # Close the file
    new_name.close
  end

end