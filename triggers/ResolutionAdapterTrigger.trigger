trigger ResolutionAdapterTrigger on Resolution_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
