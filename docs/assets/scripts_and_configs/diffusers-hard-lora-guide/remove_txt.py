import os

# Get the current directory
current_dir = os.getcwd()

# Loop through all files in the current directory
for file_name in os.listdir(current_dir):
    # Check if the file has a txt extension
    if not file_name.endswith(".txt"):
        continue
    
    # Get the base name of the file (without extension)
    file_base_name = os.path.splitext(file_name)[0]
    
    # Check if there is a corresponding image file with jpg or png extension
    if not os.path.isfile(f"{file_base_name}.jpg") and not os.path.isfile(f"{file_base_name}.png"):
        # If there is no corresponding image file, delete the txt file
        os.remove(file_name)
        print(f"Deleted file: {file_name}")