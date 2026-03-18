# 📚 Biblioteka CRUD (PHP + MySQL)

Prosty projekt edukacyjny pokazujący, jak działa **CRUD** w PHP z wykorzystaniem **MySQL (mysqli)**.
Idealny dla początkujących oraz do przygotowania do egzaminów **INF.03 / INF.04**.

---

# 🧠 Co to jest CRUD?

CRUD to podstawowe operacje wykonywane na danych w bazie:

### ➕ CREATE (tworzenie)

Dodawanie nowych rekordów do bazy danych.

👉 Przykład: dodanie nowej książki

---

### 📋 READ (odczyt)

Pobieranie i wyświetlanie danych z bazy.

👉 Przykład: lista wszystkich książek

---

### ✏️ UPDATE (aktualizacja)

Modyfikowanie istniejących danych.

👉 Przykład: zmiana tytułu książki

---

### 🗑️ DELETE (usuwanie)

Usuwanie danych z bazy.

👉 Przykład: usunięcie książki

---

# ⚙️ Jak działa ten projekt?

1. PHP łączy się z bazą danych (`mysqli_connect`)
2. Wysyła zapytanie SQL (`mysqli_query`)
3. Pobiera dane (`mysqli_fetch_assoc`)
4. Wyświetla dane w HTML

---

# 📂 Struktura projektu

```
biblioteka-crud/
│── README.md
│── config.php
│── index.php
│── dodaj.php
│── edytuj.php
│── baza.sql
```

---

# 🗄️ Baza danych (baza.sql)

```sql
CREATE DATABASE biblioteka;
USE biblioteka;

CREATE TABLE ksiazki (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tytul VARCHAR(100),
    autor VARCHAR(100),
    rok INT
);

INSERT INTO ksiazki (tytul, autor, rok) VALUES
('Pan Tadeusz', 'Adam Mickiewicz', 1834),
('Quo Vadis', 'Henryk Sienkiewicz', 1896);
```

---

# ⚙️ Połączenie z bazą (config.php)

```php
<?php
$conn = mysqli_connect("localhost", "root", "", "biblioteka");

if (!$conn) {
    die("Błąd połączenia: " . mysqli_connect_error());
}
?>
```

---

# ➕ CREATE – dodawanie danych (dodaj.php)

```php
<?php
require 'config.php';

if (isset($_POST['dodaj'])) {
    $tytul = $_POST['tytul'];
    $autor = $_POST['autor'];
    $rok = $_POST['rok'];

    mysqli_query($conn, "INSERT INTO ksiazki (tytul, autor, rok)
    VALUES ('$tytul', '$autor', '$rok')");

    header("Location: index.php");
}
?>

<form method="POST">
    Tytuł: <input type="text" name="tytul"><br>
    Autor: <input type="text" name="autor"><br>
    Rok: <input type="number" name="rok"><br>
    <button name="dodaj">Dodaj</button>
</form>
```

---

# 📋 READ – wyświetlanie danych (index.php)

```php
<?php
require 'config.php';

$result = mysqli_query($conn, "SELECT * FROM ksiazki");

while($row = mysqli_fetch_assoc($result)) {
    echo $row['tytul'] . "<br>";
}
?>
```

---

# ✏️ UPDATE – edycja danych (edytuj.php)

```php
<?php
require 'config.php';

$id = $_GET['id'];

if (isset($_POST['zapisz'])) {
    $tytul = $_POST['tytul'];

    mysqli_query($conn, "UPDATE ksiazki 
    SET tytul='$tytul'
    WHERE id=$id");
}
?>
```

---

# 🗑️ DELETE – usuwanie danych (index.php)

```php
<?php
if (isset($_GET['usun'])) {
    $id = $_GET['usun'];
    mysqli_query($conn, "DELETE FROM ksiazki WHERE id=$id");
}
?>
```

---

# ⚠️ Ważna informacja

Ten projekt jest **wersją edukacyjną**:

❌ brak zabezpieczenia przed SQL Injection
❌ brak walidacji danych

👉 W praktyce używa się:

* Prepared Statements (PDO)
* walidacji danych

---

# ▶️ Jak uruchomić

1. Uruchom XAMPP / Laragon
2. Zaimportuj `baza.sql` do MySQL
3. Wgraj pliki do `htdocs`
4. Otwórz w przeglądarce:

```
http://localhost/biblioteka-crud/index.php
```

---

# 👨‍💻 Autor

Krzysztof Pawłowski
