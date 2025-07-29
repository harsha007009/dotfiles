// TypeScript Test File
interface User {
  id: number;
  name: string;
  email: string;
  isActive?: boolean;
}

class UserManager {
  private users: User[] = [];

  addUser(user: User): void {
    this.users.push(user);
  }

  findUser(id: number): User | undefined {
    return this.users.find(user => user.id === id);
  }

  getActiveUsers(): User[] {
    return this.users.filter(user => user.isActive ?? true);
  }

  updateUser(id: number, updates: Partial<User>): boolean {
    const userIndex = this.users.findIndex(user => user.id === id);
    if (userIndex === -1) return false;

    this.users[userIndex] = { ...this.users[userIndex], ...updates };
    return true;
  }
}

// Generic function example
function asyncMap<T, U>(
  items: T[],
  mapper: (item: T) => Promise<U>
): Promise<U[]> {
  return Promise.all(items.map(mapper));
}

// Usage examples
const userManager = new UserManager();

const newUser: User = {
  id: 1,
  name: "John Doe",
  email: "john@example.com",
  isActive: true
};

userManager.addUser(newUser);

// This should show TypeScript error (wrong type)
// userManager.addUser("invalid user");

// Test async function
asyncMap([1, 2, 3], async (num) => num * 2)
  .then(results => console.log(results));

// Type assertion and union types
type Status = "loading" | "success" | "error";

interface ApiResponse<T> {
  data: T;
  status: Status;
  message?: string;
}

async function fetchUser(id: number): Promise<ApiResponse<User>> {
  // Simulate API call
  const user = userManager.findUser(id);
  
  if (user) {
    return {
      data: user,
      status: "success"
    };
  }
  
  return {
    data: {} as User, // This might show a warning
    status: "error",
    message: "User not found"
  };
}

// Advanced TypeScript features
type UserKeys = keyof User;
type UserWithoutId = Omit<User, 'id'>;
type PartialUser = Partial<User>;

const userKey: UserKeys = "name"; // Should autocomplete
const newUserData: UserWithoutId = {
  name: "Jane Doe",
  email: "jane@example.com"
};

console.log("TypeScript test file loaded!");
