import 'package:flutter/material.dart';
import 'list_pokemon.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();
  String _searchByName = '';
  @override
  Widget build(BuildContext context) {
    var pwidth = MediaQuery.of(context).size.width;
    var pheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0),
        width: pwidth,
        height: pheight,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                onSubmitted: (value) {
                  _searchByName = value;
                },
                keyboardType: TextInputType.text,
                controller: _searchController,
                decoration: InputDecoration(
                    // focusedBorder: Is activated when we click/focus on the TextField.
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.white, width: 0),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'Tìm kiếm',
                    prefixIcon: const Icon(Icons.search_rounded),
                    prefixIconColor: Colors.black),
              ),
            ),
            ListPokemon(
              searchByName: _searchByName,
              pheight: pheight,
            ),
          ],
        ),
      ),
    );
  }
}
/*
Đoạn code trên là một ứng dụng Flutter đơn giản để hiển thị danh sách các Pokemon và cho phép tìm kiếm theo tên. Nó bao gồm hai Widget chính: `HomeScreen` và `ListPokemon`.

`HomeScreen` là một `StatelessWidget` và là widget gốc của ứng dụng. Nó chứa một `TextField` để người dùng có thể tìm kiếm Pokemon và một `ListPokemon` để hiển thị danh sách Pokemon. 
`TextField` này sử dụng một `TextEditingController` để lấy giá trị của ô tìm kiếm, trong khi `ListPokemon` được tạo bởi một `FutureBuilder` để hiển thị danh sách Pokemon.

`ListPokemon` là một `StatefulWidget` và chứa một danh sách các Pokemon. 
Widget này lấy một chuỗi tìm kiếm làm đối số và sử dụng nó để lọc danh sách Pokemon. 
Nó cũng sử dụng một `FutureBuilder` để hiển thị danh sách Pokemon. 

Trong hàm `initState`, nó khởi tạo một biến `futurePokemon` bằng cách gọi hàm `searchPokemon` với chuỗi tìm kiếm được truyền vào từ `HomeScreen`. 
Hàm `searchPokemon` sẽ trả về một danh sách Pokemon đã được lọc dựa trên chuỗi tìm kiếm, hoặc danh sách Pokemon đầy đủ nếu chuỗi tìm kiếm là rỗng.

Trong hàm `didUpdateWidget`, nó kiểm tra xem chuỗi tìm kiếm đã thay đổi hay chưa. 
Nếu đã thay đổi, nó sẽ gọi lại hàm `searchPokemon` với chuỗi tìm kiếm mới và gán kết quả vào biến `futurePokemon`. 
Điều này sẽ đảm bảo rằng danh sách Pokemon được hiển thị sẽ được cập nhật khi người dùng thay đổi chuỗi tìm kiếm.

Trong hàm `build`, nó trả về một `FutureBuilder` với biến `futurePokemon` làm đối số. 
Nếu `snapshot` chứa dữ liệu, nó sẽ hiển thị danh sách Pokemon bằng cách sử dụng một `GridView.builder`. 
Nếu có lỗi, nó sẽ hiển thị thông báo lỗi. Nếu chưa có dữ liệu, nó sẽ hiển thị một `CircularProgressIndicator` để cho người dùng biết rằng ứng dụng đang tải dữ liệu. 

Về phần `HomeScreen`, khi người dùng nhập giá trị vào `TextField`, nó sẽ gọi hàm `onChanged` và cập nhật biến `searchText`. 
Biến này sẽ được sử dụng để cập nhật biến `searchController` của `ListPokemon`. 
Do đó, khi giá trị của `searchText` thay đổi, `ListPokemon` sẽ được cập nhật và hiển thị danh sách Pokemon mới tương ứng với giá trị tìm kiếm mới.
 */