package repository.impl;

import bean.House;
import bean.Room;
import bean.Villa;
import repository.IServiceRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepository implements IServiceRepository {

    @Override
    public List<House> showHouse() {
        List<House> houseList = new ArrayList<>();
        try {
            PreparedStatement statement = BaseRepository.connection.prepareStatement
                    ("select ma_dich_vu,ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,ma_kieu_thue," +
                            "tieu_chuan_phong,mo_ta_tien_nghi_khac,so_tang" +
                            "from dich_vu");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                House houseObj = new House();
                houseObj.setService_id(Integer.parseInt(resultSet.getString("ma_dich_vu")));
                houseObj.setService_name(resultSet.getString("ten_dich_vu"));
                houseObj.setService_area(Double.parseDouble(resultSet.getString("dien_tich")));
                houseObj.setService_cost(Double.parseDouble(resultSet.getString("chi_phi_thue")));
                houseObj.setService_max_people(Integer.parseInt(resultSet.getString("so_nguoi_toi_da")));
                houseObj.setRent_type_id(Integer.parseInt(resultSet.getString("ma_kieu_thue")));
                houseObj.setStandard_room(resultSet.getString("tieu_chuan_phong"));
                houseObj.setDescription_other_convenience((resultSet.getString("mo_ta_tien_nghi_khac")));
                houseObj.setNumber_of_floors(Integer.parseInt(resultSet.getString("so_tang")));
                houseList.add(houseObj);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return houseList;
    }

    @Override
    public List<Room> showRoom() {
        return null;
    }

    @Override
    public List<Villa> showVilla() {
        return null;
    }

    @Override
    public void createHouse(House house) {
        try {
            PreparedStatement statement = BaseRepository.connection.prepareStatement
                    ("insert into dich_vu(ma_dich_vu,ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,ma_kieu_thue," +
                            "tieu_chuan_phong,mo_ta_tien_nghi_khac,so_tang)" +
                            "values(?,?,?,?,?,?,?,?,?)");
            statement.setInt(1,house.getService_id());
            statement.setString(2,house.getService_name());
            statement.setDouble(3,house.getService_area());
            statement.setDouble(4,house.getService_cost());
            statement.setInt(5,house.getService_max_people());
            statement.setInt(6,house.getRent_type_id());
            statement.setString(7,house.getStandard_room());
            statement.setString(8,house.getDescription_other_convenience());
            statement.setInt(9,house.getNumber_of_floors());

            statement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void createVilla(Villa villa) {

    }

    @Override
    public void createRoom(Room room) {

    }
}
