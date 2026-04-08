trigger AssignmentPluginTrigger on Assignment_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentPluginHandler.handleAfterDelete(Trigger.old);
    }
}
