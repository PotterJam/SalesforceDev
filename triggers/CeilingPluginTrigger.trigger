trigger CeilingPluginTrigger on Ceiling_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingPluginHandler.handleAfterDelete(Trigger.old);
    }
}
