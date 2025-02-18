// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Todos {
    struct Todo {
        string text;
        bool completed;
    }
    Todo[] public todos;

    function create(string calldata _text) public {
        todos.push(Todo(_text, false));
        todos.push(Todo({text: _text, completed: false}));
        Todo memory todo;
        todo.text = _text;
        todos.push(todo);
    }

    function get(uint256 _index, string calldata _text)
        public
        view
        returns (string memory text, bool completed)
    {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    function updateText(uint256 _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }
    function toggleCompeted(uint256 _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}

/**
 * calldata 的主要特点
只读：

calldata 是只读的，不能修改其内容。

如果尝试修改 calldata 中的数据，编译器会报错。

高效：

calldata 直接指向外部调用传入的数据，避免了数据拷贝，因此 Gas 消耗较低。

适合处理外部调用传入的较大数据（如数组或结构体）。

仅用于外部函数：

calldata 通常用于标记外部函数（external 函数）的参数。

也可以用于公共函数（public 函数），但通常不用于内部函数（internal 或 private 函数）。

生命周期：

calldata 的数据仅在函数执行期间有效，函数执行结束后数据会被清除。
 */

/**
 * 与 memory 和 storage 的区别：

memory：数据存储在内存中，可读写，但需要额外的 Gas 来拷贝数据。

storage：数据存储在链上，可读写，但访问和修改的 Gas 成本较高。

calldata：数据是只读的，直接引用外部传入的数据，Gas 成本最低。
 */