require('rspec')
require('todo')

describe(Todo) do

  before() do
    Todo.clear()
  end

  describe("#description") do
    it("lets you give it a description") do
      test_task = Todo.new("scrub the zebra")
      expect(test_task.description()).to(eq("scrub the zebra"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Todo.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a task to array of saved tasks") do
      test_task = Todo.new("dunk the monkey")
      test_task.save()
      expect(Todo.all()).to(eq([test_task]))
    end
  end

  describe(".clear") do
    it("empties out all tasks") do
      Todo.new("punk the penguin").save()
      Todo.clear()
      expect(Todo.all()).to(eq([]))
    end
  end
end
