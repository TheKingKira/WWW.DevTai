package iuh.fit.t3;

import java.util.ArrayList;
import java.util.List;

public class AccountDAO {
    private static List<Account> accounts = new ArrayList<>();

    // Static block to initialize some sample data
    static {
        accounts.add(new Account("admin", "123456", "Admin", "User", "admin@example.com",
                "0123456789", "Male", "Vietnam"));
        accounts.add(new Account("user1", "password", "John", "Doe", "john@example.com",
                "0987654321", "Male", "USA"));
    }

    // Add new account
    public boolean addAccount(Account account) {
        // Check if username already exists
        if (isUsernameExists(account.getUsername())) {
            return false;
        }
        accounts.add(account);
        return true;
    }

    // Check if username exists
    public boolean isUsernameExists(String username) {
        return accounts.stream().anyMatch(acc -> acc.getUsername().equals(username));
    }

    // Get all accounts (without password for display)
    public List<Account> getAllAccounts() {
        return new ArrayList<>(accounts);
    }

    // Find account by username
    public Account findByUsername(String username) {
        return accounts.stream()
                .filter(acc -> acc.getUsername().equals(username))
                .findFirst()
                .orElse(null);
    }

    // Validate login
    public boolean validateAccount(String username, String password) {
        Account account = findByUsername(username);
        return account != null && account.getPassword().equals(password);
    }

    // Get total number of accounts
    public int getTotalAccounts() {
        return accounts.size();
    }
}