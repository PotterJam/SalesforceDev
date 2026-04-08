trigger LogisticsSnapshotTrigger on Logistics_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
