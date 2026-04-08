trigger DurationPluginTrigger on Duration_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationPluginHandler.handleAfterDelete(Trigger.old);
    }
}
