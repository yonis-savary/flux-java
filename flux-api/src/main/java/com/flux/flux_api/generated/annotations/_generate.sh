for file in ../entity/*.java; do
    class=$(basename "$file" .java)

    cat <<EOF > ./${class}Response.java
package com.flux.flux_api.generated.annotations;

import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import com.flux.flux_api.generated.entity.${class};

import java.lang.annotation.*;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@ApiResponse(
    responseCode = "200",
    description = "Success",
    content = @Content(
        mediaType = "application/json",
        schema = @Schema(implementation = ${class}.class)
    )
)
public @interface ${class}Response {
    Class<?> schema();
}
EOF

    cat <<EOF > ./${class}ListResponse.java
package com.flux.flux_api.generated.annotations;

import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.media.ArraySchema;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import com.flux.flux_api.generated.entity.${class};

import java.lang.annotation.*;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@ApiResponse(
    responseCode = "200",
    description = "Success",
    content = @Content(
        mediaType = "application/json",
        array = @ArraySchema(
            schema = @Schema(implementation = ${class}.class)
        )
    )
)
public @interface ${class}ListResponse {
    Class<?> schema();
}
EOF
done
