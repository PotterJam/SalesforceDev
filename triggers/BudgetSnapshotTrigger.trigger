trigger BudgetSnapshotTrigger on Budget_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BudgetSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BudgetSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BudgetSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BudgetSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
