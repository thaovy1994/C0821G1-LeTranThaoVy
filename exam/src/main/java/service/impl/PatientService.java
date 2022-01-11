package service.impl;

import bean.Patient;
import repository.IPatientRepository;
import repository.impl.PatientRepository;
import service.IPatientService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PatientService implements IPatientService {
    private IPatientRepository repository = new PatientRepository();

    @Override
    public List<Patient> show() {
        try {
            List<Patient> patientList = repository.show();
            if (patientList.size() == 0) {
                return null;
            }
            return patientList;
        } catch (Exception e) {
            e.getMessage();
            return null;
        }
    }

    @Override
    public Map<String, String> edit(Patient patient) {
        Map<String, String> msgList = new HashMap<>();
        if (patient.getPatient_id().equals("")) {
            msgList.put("msgId", "Please input !");
        } else if (!patient.getName().matches("^[A-za-z]+$")) {
            msgList.put("name", "Not contain number in Name");
        } else {
            Map<String, String> msgListRepo = this.repository.edit(patient);
            if (!msgListRepo.isEmpty()) {
                msgList.put("msgId", msgListRepo.get("msgId"));
            }
        }
        return msgList;

    }

    @Override
    public void delete(Patient patient) {
        this.repository.delete(patient);
    }
}
