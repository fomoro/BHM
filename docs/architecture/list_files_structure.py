import os

def list_files(startpath, output_file):
    with open(output_file, 'w', encoding='utf-8') as f:
        for root, dirs, files in os.walk(startpath):
            level = root.replace(startpath, '').count(os.sep)
            indent = '│   ' * level
            f.write(f'{indent}├── {os.path.basename(root)}/\n')
            subindent = '│   ' * (level + 1)
            for file in files:
                f.write(f'{subindent}├── {file}\n')

if __name__ == "__main__":
    root_directory = r"C:\inetpub\wwwroot\Dev\Extranet Organizado"
    output_file = r"C:\Users\jonathan.moreno\Downloads\directory_structure.txt"
    list_files(root_directory, output_file)
    print(f"Estructura de archivos generada en {output_file}")
