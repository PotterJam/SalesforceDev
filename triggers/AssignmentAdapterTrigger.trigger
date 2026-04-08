trigger AssignmentAdapterTrigger on Assignment_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
