package service;

import bean.Patient;

import java.util.List;
import java.util.Map;

public interface IPatientService {
    List<Patient> show();

    Map<String, String> edit(Patient patient);

    void delete(Patient patient);
}
