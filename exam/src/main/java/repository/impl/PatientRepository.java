package repository.impl;

import bean.Patient;
import repository.IPatientRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PatientRepository implements IPatientRepository {
    @Override
    public List<Patient> show() {
        List<Patient> myList = new ArrayList<>();
        try {
            PreparedStatement statement = BaseRepository.connection.prepareStatement
                    ("select * from patient\n" +
                            "join records on patient.patient_id = records.patient_id;");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Patient patient = new Patient();
                patient.setPatient_id(resultSet.getString("patient_id"));
                patient.setRecords_id(resultSet.getString("records_id"));
                patient.setName(resultSet.getString("name"));
                patient.setDay_in(resultSet.getString("day_in"));
                patient.setDay_out(resultSet.getString("date_out"));
                patient.setReason(resultSet.getString("reason"));
                myList.add(patient);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return myList;
    }

    @Override
    public Map<String, String> edit(Patient patient) {
        Map<String, String> msgList = new HashMap<>();
        try {
            PreparedStatement statementCheck = BaseRepository.connection.prepareStatement
                    ("select * from patient where patient_id =?");
            statementCheck.setString(1, patient.getPatient_id());
            ResultSet resultSet = statementCheck.executeQuery();
            if (!resultSet.next()) {
                msgList.put("msgId", "Id is not exists !");
                return msgList;
            } else {
                PreparedStatement statement = BaseRepository.connection.prepareStatement
                        ("update patient set `name` =?,day_in=?,date_out=?,reason=? " +
                                "where patient_id =?;");
                statement.setString(1, patient.getName());
                statement.setString(2, patient.getDay_in());
                statement.setString(3, patient.getDay_out());
                statement.setString(4, patient.getReason());
                statement.setString(5, patient.getPatient_id());
                statement.executeUpdate();
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return msgList;
    }

    @Override
    public void delete(Patient patient) {
        try {
            PreparedStatement statement = BaseRepository.connection.prepareStatement
                    ("delete from patient where patient_id=?");
            statement.setString(1, patient.getPatient_id());
            statement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
