trigger StatusPluginTrigger on Status_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusPluginHandler.handleAfterDelete(Trigger.old);
    }
}
