trigger PayrollSnapshotTrigger on Payroll_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
