trigger EscalationSnapshotTrigger on Escalation_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) EscalationSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) EscalationSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) EscalationSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) EscalationSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
