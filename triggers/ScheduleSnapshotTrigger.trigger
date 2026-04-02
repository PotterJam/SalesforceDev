trigger ScheduleSnapshotTrigger on Schedule_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScheduleSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScheduleSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScheduleSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScheduleSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
