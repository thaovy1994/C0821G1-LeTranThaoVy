package repository;

import bean.House;
import bean.Room;
import bean.Villa;

import java.util.List;

public interface IServiceRepository {
    List<House> showHouse();
    List<Room> showRoom();
    List<Villa> showVilla();

    void createHouse(House house);

    void createVilla(Villa villa);

    void createRoom(Room room);
}
