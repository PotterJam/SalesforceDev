trigger LeadPluginTrigger on Lead_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadPluginHandler.handleAfterDelete(Trigger.old);
    }
}
