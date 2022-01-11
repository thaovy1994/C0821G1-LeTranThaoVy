package bean;

public class Patient {
    private String patient_id;
    private String records_id;
    private String name;
    private String day_in;
    private String day_out;
    private String reason;

    public Patient() {
    }

    public Patient(String patient_id, String records_id, String name, String day_in, String day_out, String reason) {
        this.patient_id = patient_id;
        this.records_id = records_id;
        this.name = name;
        this.day_in = day_in;
        this.day_out = day_out;
        this.reason = reason;
    }

    public String getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(String patient_id) {
        this.patient_id = patient_id;
    }

    public String getRecords_id() {
        return records_id;
    }

    public void setRecords_id(String records_id) {
        this.records_id = records_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDay_in() {
        return day_in;
    }

    public void setDay_in(String day_in) {
        this.day_in = day_in;
    }

    public String getDay_out() {
        return day_out;
    }

    public void setDay_out(String day_out) {
        this.day_out = day_out;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }
}

