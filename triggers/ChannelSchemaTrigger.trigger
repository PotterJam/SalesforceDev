trigger ChannelSchemaTrigger on Channel_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ChannelSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ChannelSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ChannelSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ChannelSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
