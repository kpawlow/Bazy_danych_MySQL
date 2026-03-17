# 🐘 Przewodnik po MySQL & phpMyAdmin

Repozytorium zawiera zbiór dobrych praktyk, gotowych schematów baz danych oraz instrukcji zarządzania danymi przy użyciu narzędzia **phpMyAdmin**.

---

## 🛠️ Technologie i Narzędzia

* **MySQL / MariaDB** – System zarządzania relacyjną bazą danych.
* **phpMyAdmin** – Webowy interfejs graficzny (GUI) do łatwej administracji.
* **SQL** – Język zapytań strukturalnych.

---

## 🚀 Szybki Start z phpMyAdmin

Aby rozpocząć pracę z bazą danych zawartą w tym repozytorium, wykonaj poniższe kroki:

### 📥 Importowanie bazy
1. Otwórz **phpMyAdmin** w przeglądarce (zazwyczaj `localhost/phpmyadmin`).
2. Stwórz nową bazę danych, klikając przycisk **"Nowa"**.
3. Wybierz stworzoną bazę i przejdź do zakładki **"Import"**.
4. Wybierz plik `.sql` z tego repozytorium i kliknij **"Wykonaj"**.

### 📤 Eksportowanie bazy
1. Wybierz bazę danych po lewej stronie.
2. Przejdź do zakładki **"Eksport"**.
3. Wybierz metodę **"Szybka"** i format **"SQL"**.
4. Kliknij **"Wykonaj"**, aby pobrać plik kopii zapasowej.

---

## 📊 Przykładowe Zapytania SQL

W plikach tego repozytorium znajdziesz zapytania podzielone na kategorie:

### 🔹 DDL (Data Definition Language)
Tworzenie struktury tabeli:
```sql
CREATE TABLE IF NOT EXISTS produkty (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nazwa VARCHAR(100) NOT NULL,
    cena DECIMAL(10, 2) NOT NULL,
    data_dodania TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
